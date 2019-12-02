const { hooks } = require('@adonisjs/ignitor')

hooks.after.providersBooted(() => {
  const Database = use('Database')
  // Database.on('query', console.log)
  // Database.on('sql', console.log)
})