require_relative './config/environment'

run ApplicationController
use ItemsController
use OrdersController
use ShoppersController
