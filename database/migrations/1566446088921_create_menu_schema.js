'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class CreateMenuSchema extends Schema {
  up () {
    this.create('menus', (table) => {
      table.increments()
      table.integer('parent_id').nullable()
      // table.integer('role_id').unsigned().index()
      // table.foreign('role_id').refernce('id').on('roles').onDelete('cascade')
      table.integer('permission_id').unsigned().index()
      table.foreign('permission_id').references('id').on('permissions').onDelete('cascade')
      table.string('menu_link').nullable()
      table.integer('is_active').nullable()
      table.string('class').nullable()
      table.timestamps()
    })
  }

  down () {
    this.drop('menus')
  }
}

module.exports = CreateMenuSchema
