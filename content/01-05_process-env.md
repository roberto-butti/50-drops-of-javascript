## Access to environment variables: process.env
The `process` module has the `env` attribute to return information on the environment variable.
The `process.env` attribute contains an object and it represents the list of environment variables.

Retrieve the environment variables object:
```javascript
console.log(process.env)
```
Access to a specific environment variable (for example to the PATH environment variable):
```javascript
console.log(process.env.PATH)
```
Access dynamically to a environment variable:
```javascript
const envVarName = 'PATH'
if (envVarName in process.env) {
  console.log(process.env[envVarName])
} else {
  console.log('no %s defined', envVarName)
}
```
