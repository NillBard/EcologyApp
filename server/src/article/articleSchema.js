const yup = require('yup')

module.exports = {
  articleSchema: yup.object().shape({
    title: yup.string().required('title is required'),
    text: yup.string().required('Text is required'),
  }),
}
