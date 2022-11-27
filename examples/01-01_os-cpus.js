const os = require('os')
const cpus = os.cpus()
cpus.forEach(cpu => {
  console.info(cpu.model + ' speed: ' + cpu.speed)
  console.table(cpu.times)
})
