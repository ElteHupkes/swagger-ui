class StatusCodeView extends Backbone.View
  initialize: ->

  render: ->    
    template = @template()
    $(@el).html(template(@model))

    # Display status code signature for error responses as well
    if @model.responseClassSignature and @model.responseClassSignature != 'string'
      signatureModel =
        sampleJSON: @model.responseSampleJSON
        isParam: false
        signature: @model.responseClassSignature

      responseSignatureView = new SignatureView({model: signatureModel, tagName: 'div'})
      $('.model-signature', $(@el)).append responseSignatureView.render().el
    else
      $('.model-signature', $(@el)).html(@model.responseClass)

    if @model.sampleJSON
      signatureView = new SignatureView({model: signatureModel, tagName: 'div'})
      $('.model-signature', $(@el)).append signatureView.render().el
    else
      $('.model-signature', $(@el)).html(@model.signature)
    
    @

  template: ->
    Handlebars.templates.status_code

