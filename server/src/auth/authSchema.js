const yup = require('yup')

module.exports = {
  registerSchema: yup.object().shape({
    name: yup
      .string()
      .required('Name is required')
      .min(3, `Name must be at least 3 characters long`),
    email: yup
      .string()
      .email('Email must be valid')
      .required('Email is required'),
    password: yup
      .string()
      .required('Password is required')
      .min(6, `Password must be at least 6 characters long`),
  }),

  loginSchema: yup.object().shape({
    email: yup
      .string()
      .email('Email must be valid')
      .required('Email is required'),
    password: yup.string().required('Password is required'),
  }),

  authenticateSchema: yup.object().shape({
    token: yup.string().required('Refresh token is required'),
  }),
}
