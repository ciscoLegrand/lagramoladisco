// Load all the controllers within this directory and all subdirectories. 
// Controller files must be named *_controller.js.

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

//lightbox
import Lightbox from 'stimulus-lightbox'
//swiperjs
import Carousel from "stimulus-carousel"

const application = Application.start()
const context = require.context("controllers", true, /_controller\.js$/)
application.load(definitionsFromContext(context))

application.register("lightbox", Lightbox)
application.register("carousel", Carousel)