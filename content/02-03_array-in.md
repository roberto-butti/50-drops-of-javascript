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

I think the `in` operator is one of the best ways to check the presence of an attribute because for example if you want to check if the value is undefined you can't distinguish the cases if the property doesn't exist or the property exists and has undefined value :

```javascript
const fruits = {
  strawberry: 'Strawberry',
  kiwi: 'Kiwi',
  lemon: 'Lemon'
}

fruits.something = undefined
if (fruits.somethingelse === undefined) {
    console.log('Somethingelse attribute does not exist')
}
if (fruits.something === undefined) {
  console.log('Something attribute exists but the value is undefined')
}
```
