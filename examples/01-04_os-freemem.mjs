import { freemem } from 'os'
const m = freemem()
console.log(
  'Hi, the free memory is %d bytes',
  m
)
console.log(
  'Hi, the free memory is %d kilobytes',
  m / 1024
)
console.log(
  'Hi, the free memory is %d megabytes',
  m / 1024 / 1024
)

console.table(m)
/*
┌──────────┬──────────────────┐
│ (index)  │      Values      │
├──────────┼──────────────────┤
│   uid    │       501        │
│   gid    │        20        │
│ username │    'roberto'     │
│ homedir  │ '/Users/roberto' │
│  shell   │    '/bin/zsh'    │
└──────────┴──────────────────┘
*/
