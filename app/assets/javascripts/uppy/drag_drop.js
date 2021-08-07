const Uppy = require('@uppy/core')
const Dashboard = require('@uppy/dashboard')
const ActiveStorageUpload = require('@excid3/uppy-activestorage-upload')

require('@uppy/core/dist/style.css')
require('@uppy/dashboard/dist/style.css')

document.addEventListener('turbolinks:load', () => {
  document.querySelectorAll('[data-uppy]').forEach(element => setupUppy(element))
})

function setupUppy(element) {
  let trigger = element.querySelector('[data-behavior="uppy-trigger"]')
  let form = element.closest('form')
  let direct_upload_url = document.querySelector("meta[name='direct-upload-url']").getAttribute("content")
  let field_name = element.dataset.uppy 

  trigger.addEventListener("click", (event)=> event.preventDefault())

  let uppy = Uppy({
    autoProceed: true,
    allowMultipleUploads: true,
    logger: Uppy.debugLogger
  })

  uppy.use(ActiveStorageUpload, {
    directUploadUrl: direct_upload_url
  })

  uppy.use(Dashboard, {
    trigger: trigger,
    closestAfterFinish: true,
    id: 'Dashboard',
    target: '.dashboardContainer',
    height: 470,
    metaFields: [
      { id: 'name', name: 'Name', placeholder: 'file name' },
      { id: 'caption', name: 'Caption', placeholder: 'describe what the image is about' }
    ],
    inline: true,
    showLinkToFileUploadResult: true,
    showProgressDetails: true,
    hideUploadButton: false,
    hideRetryButton: false,
    hidePauseResumeButton: true,
    hideCancelButton: false,
    hideProgressAfterFinish: false,
    // doneButtonHandler: () => {
    //   this.uppy.reset()
    //   this.requestCloseModal()
    // },
    note: null,
    closeModalOnClickOutside: false,
    disableStatusBar: false,
    disableInformer: false,
    disableThumbnailGenerator: false,
    disablePageScrollWhenModalOpen: true,
    animateOpenClose: true,
    fileManagerSelectionType: 'files',
    proudlyDisplayPoweredByUppy: false,
    // onRequestCloseModal: () => this.closeModal(),
    showSelectedFiles: true,
    showRemoveButtonAfterComplete: false,
    browserBackButtonClose: false,
    theme: 'dark',
    autoOpenFileEditor: false
  })

  uppy.on('complete', (result) => {
    console.log(result)    

    element.querySelectorAll('[data-pending-upload]').forEach(element => element.parentNode.removeChild(element))

    result.successful.forEach(file => {
      appendUploadedFile(element, file, field_name)
      setPreview(element, file)
    })

    // uppy.reset()
  })

  function appendUploadedFile(element, file, field_name) {
    const hiddenField = document.createElement('input')

    hiddenField.setAttribute('type', 'hidden')
    hiddenField.setAttribute('name', field_name)
    hiddenField.setAttribute('data-pending-upload', true)
    hiddenField.setAttribute('value', file.response.signed_id)

    element.appendChild(hiddenField)    
  }

  function setPreview(element, file) {
    let preview = element.querySelector('[data-behavior="uppy-preview"]')
    if (preview) {
      preview.src = file.preview
    }    
  }
}


