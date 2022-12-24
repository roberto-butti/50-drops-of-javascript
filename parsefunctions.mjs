import { createInterface } from 'readline'
import { EOL } from 'os'
import { createReadStream, existsSync, writeFile } from 'fs'

async function readNextSection () {
  const userFile = './list-of-functions.md'
  const r = createInterface({
    input: createReadStream(userFile)
  })
  let nextSection = false
  r.on('line', function (text) {
    if (text.includes('[ ]')) {
      const stringMatch = /- \[ \] (\d{2})-(\d{2}) (.*)/
      // rep = /\d{2}/g
      const string = text.match(stringMatch)
      if (nextSection === false) {
        nextSection = {
          chapter: string[1],
          section: string[2],
          title: string[3]
        }
      }
      // console.log("" + string);
    }
  })
  await new Promise((resolve) => r.once('close', resolve))
  return nextSection
}

async function getFilename (nextSection) {
  const chapters = {
    '01': 'os',
    '02': 'array'
  }
  const question = `going to create ${nextSection.title} ? `
  let result = ''
  const rl = createInterface(process.stdin, process.stdout)
  await rl.question(question, (answer) => {
    console.log(`creating file: ${nextSection.chapter} ${answer}`)
    const slugChapter = chapters[nextSection.chapter] || 'ext'
    result = `${nextSection.chapter}-${nextSection.section}_${slugChapter}-${answer}`
    rl.close()
  })
  await new Promise((resolve) => rl.once('close', resolve))
  return result
}

console.log('Example to read line by line text')
const nextSection = await readNextSection()
if (nextSection) {
  console.info('Next section is:')
  console.table(nextSection)
} else {
  console.info('Next section NOT found')
}

const filename = await getFilename(nextSection)
console.log(filename)
const exampleFilename = `examples/${filename}.mjs`
const markdownFilename = `content/${filename}.md`

if (existsSync(exampleFilename)) {
  console.log(`Example file ${exampleFilename} already exists`)
} else {
  console.log(`Example file ${exampleFilename} creating...`)
  writeFile(exampleFilename, 'console.log("Hello World!")', function (err) {
    if (err) throw err
    console.log('Saved!')
  })
}

if (existsSync(markdownFilename)) {
  console.log(`Example file ${markdownFilename} already exists`)
} else {
  console.log(`Example file ${markdownFilename} creating...`)
  writeFile(markdownFilename, `## ${nextSection.title}${EOL}${nextSection.title}`, function (err) {
    if (err) throw err
    console.log('Saved!')
  })
}
