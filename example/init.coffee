# file: example/init.coffee

process.env['DEBUG'] = 'vault' # switch on debug mode
vault = require("#{__dirname}/../index")()

vault.initialized (err, result)->
  vault.initialize { secret_shares: 1, secret_threshold: 1 }, (err, result)->
    return if err
    { keys, root_token } = result
    vault.token = root_token
    vault.unseal { secret_shares: 1, key: keys[0] }, (err, result)->
