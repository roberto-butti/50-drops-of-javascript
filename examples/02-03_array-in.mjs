
const fruits = {
  strawberry: 'Strawberry',
  kiwi: 'Kiwi',
  lemon: 'Lemon'
}

console.table(fruits)
if ('kiwi' in fruits) {
  console.log('Kiwi is present')
}

console.log('kiwi' in fruits ? 'Yes! Kiwi' : 'ther is no kiwi here')
