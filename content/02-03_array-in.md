## Check if a key exists in the array: `in`
If you have an object and you want to check if an attribute is present you can use the `in` operator.

```javascript
const fruits = {
  strawberry: 'Strawberry',
  kiwi: 'Kiwi',
  lemon: 'Lemon'
}
// for checking the presence of an attribute you can use in operator
if ('kiwi' in fruits) {
  console.log('Kiwi is present')
}
// you can use in the short form
console.log('kiwi' in fruits ? 'Yes! Kiwi' : 'ther is no kiwi here')
```
