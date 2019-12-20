'use strict'

/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
|
| Http routes are entry points to your web application. You can create
| routes for different URL's and bind Controller actions to them.
|
| A complete guide on routing is available here.
| http://adonisjs.com/docs/4.1/routing
|
*/

/** @type {typeof import('@adonisjs/framework/src/Route/Manager')} */
const Route = use('Route')
const Logger = use('Logger')

/**
 * LOGIN PAGE
*/
Route.get('login','SessionController.login')
Route.post('login','SessionController.store')
Route.get('logout','SessionController.logout')


/**
 * GUETS PAGE WITHOUT LOGIN
 */
Route.group(() => {
}).middleware(['guest'])


/*
*LOGIN PAGE
*/
Route.group(() => {

    Route.get('/','IndexController.index')
    Route.get('user-store','IndexController.userStore') // untuk menampilkan data user di index, header, avatar

    // error page
    Route.get('403','IndexController.error403')

    // Test cara koding
    Route.get('multipleconnection','TestController.multipleconnection')
    Route.get('joindata','TestController.joindata')
    Route.get('cekdata','TestController.cekdata')
    Route.get('cekresponse','TestController.cekresponse')

}).middleware(['login'])


/*
*UNUTK ROLE ADMIN
*/
Route.group(() => {
  Route.get('admin','AdminController.index')
  Route.post('admin','AdminController.updateUser')
  
  Route.get('admin/add-user','AdminController.adduser')
  Route.post('admin/add-user','AdminController.userSave')
  
  Route.get('admin/add-role','AdminController.addrole')
  Route.get('admin/add-permission','AdminController.addpermission')
  Route.delete('admin/del-user', 'AdminController.userDelete')

// }).middleware(['login','is:(administrator or moderator)']) 
}).middleware(['login','admin']) 




/**
 * API 
 */
Route.group(() => {

  Route.get('admin/userview/userid/:id','AdminController.UserView')
  Route.get('admin/getroles','AdminController.getRoles')

}).middleware(['login'])