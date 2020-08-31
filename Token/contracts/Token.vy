from vyper.interfaces import ERC20

implements: ERC20

event Transfer:
    sender: address
    receiver: address
    value: uint256

event Approval:
    owner: address
    spender: address
    value: uint256

supply: uint256
minter: address
balances: HashMap[address, uint256]
allowances: HashMap[address, HashMap[address, uint256]]
tokenName: public(String[100])
tokenSymbol: public(String[100])

@external
def __init__(_name: String[100], _symbol: String[100], _supply: uint256):
    self.supply = _supply
    self.tokenName = _name
    self.tokenSymbol = _symbol
    self.minter = msg.sender
    self.balances[msg.sender] = self.supply
    log Transfer(ZERO_ADDRESS, msg.sender, self.supply)

@external
@view
def totalSupply() -> uint256:
    return self.supply

@external
@view
def balanceOf(_owner: address) -> uint256:
    return self.balances[_owner]


@external
def transfer(_to: address, _value: uint256) -> bool:
    assert _value <= self.balances[msg.sender]
    self.balances[msg.sender] -= _value
    self.balances[_to] += _value
    log Transfer(msg.sender, _to, _value)
    return True

@external
@view
def allowance(_owner: address, _spender: address) -> uint256:
    return self.allowances[_owner][_spender]

@external
def approve(_spender: address, _value: uint256) -> bool:
    self.allowances[msg.sender][_spender] += _value
    log Approval(msg.sender, _spender, _value)
    return True

@external
def transferFrom(_from: address, _to: address, _value: uint256) -> bool:
    assert _value <= self.allowances[_from][_to]
    self.balances[_from] -= _value
    self.balances[_to] += _value
    log Transfer(_from, _to, _value)
    return True