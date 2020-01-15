'use strict'

const BaseExceptionHandler = use('BaseExceptionHandler')

/**
 * This class handles all exceptions thrown during
 * the HTTP request lifecycle.
 *
 * @class ExceptionHandler
 */
class ExceptionHandler extends BaseExceptionHandler {
  /**
   * Handle exception thrown during the HTTP lifecycle
   *
   * @method handle
   *
   * @param  {Object} error
   * @param  {Object} options.request
   * @param  {Object} options.response
   *
   * @return {void}
   */

  /*
  async handle (error, { request, response }) {
    response.status(error.status).send(error.message)
  }
  */

  /**
   * 
   * @param {Object} error 
   * @param {*} param1 
   */

  async handle(error, {request, response, session}){
    if(error.status === 403){
      session
          .withErrors(error.status)
          .flash({err: error.message})
      await session.commit()
      response.redirect('back')
      return
    }

    return super.handle()
  }


  /**
   * Report exception for logging or debugging.
   *
   * @method report
   *
   * @param  {Object} error
   * @param  {Object} options.request
   *
   * @return {void}
   */
  async report (error, { request }) {
    console.log(error.status);
    console.log(error.name);
    console.log(error.message); 
  }
}

module.exports = ExceptionHandler
