const yup = require('yup')

module.exports = {
  trackerSchema: yup.object().shape({
    paper: yup.number().integer().optional().min(1),
    glass: yup.number().integer().optional().min(1),
    electronic: yup.number().integer().optional().min(1),
    plastic: yup.number().integer().optional().min(1),
    batteries: yup.number().integer().optional().min(1),
  }),
}
