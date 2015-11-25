classnames = require 'classnames'

module.exports =
  _formValues: ->
    values =
      id: @props.item.id

    for k, v of @refs
      type = v.type

      switch type
        when 'select-multiple'
          value = []
          for option in v.children
            (value.push(option.value)) if option.selected

          values[k] = value
        else
          values[k] = v.value

    values

  _fieldHasErrors: (ref) ->
    @props.errors? && @props.errors[ref]?

  _inputClasses: (ref) ->
    classnames
      invalid: @_fieldHasErrors(ref)

  _errorsFor: (ref)->
    return unless @_fieldHasErrors(ref)

    @props.errors[ref].map (error, i) ->
      <div key={"#{ref}-error-#{i}"} className="error">{error}</div>

  _onSubmitClick: (e) ->
    e.preventDefault()
    formValues = @_formValues()
    @_saveItem(formValues)

  _renderHiddenInput: (name) ->
    <input type="hidden" ref={name} value={@props.item[name]} onChange={@_handleOnChange} />

  _renderInput: (name, placeHolderText, type = 'text') ->
    <div className="input">
      <input type={type} className={@_inputClasses(name)} ref={name} value={@props.item[name]} onChange={@_handleOnChange} placeholder={placeHolderText} />
      {@_errorsFor(name)}
    </div>


  _renderTextArea: (name, placeHolderText) ->
    <div className="input">
      <textarea className={@_inputClasses(name)} ref={name} value={@props.item[name]} onChange={@_handleOnChange} placeholder={placeHolderText} rows="6"/>
      {@_errorsFor(name)}
    </div>

  _renderActions: ->
    <div className="actions">
      <a href="#" onClick={@_handelCancelClick}>Cancel</a>
      <button className="btn" type="submit">
        Save
      </button>
    </div>

