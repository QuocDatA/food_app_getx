String authErrorsString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'Email or password invalid';

    case 'Invalid session token':
      return 'Token invalid';

    default:
      return 'An undefined error';
  }
}
