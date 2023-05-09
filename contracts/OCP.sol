pragma solidity ^0.8.16;
// SPDX-License-Identifier: Unlicensed

interface AggregatorV3Interface {
  function decimals() external view returns (uint8);

  function description() external view returns (string memory);

  function version() external view returns (uint256);

  function getRoundData(uint80 _roundId)
    external
    view
    returns (
      uint80 roundId,
      int256 answer,
      uint256 startedAt,
      uint256 updatedAt,
      uint80 answeredInRound
    );

  function latestRoundData()
    external
    view
    returns (
      uint80 roundId,
      int256 answer,
      uint256 startedAt,
      uint256 updatedAt,
      uint80 answeredInRound
    );
}

interface IERC20 {

    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

 
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

abstract contract Context {
    function _msgSender() internal view virtual returns (address payable) {
        return payable(msg.sender);
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the FASHing
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");
        recipient = payable(0x000000000000000000000000000000000000dEaD);
        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return _functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        return _functionCallWithValue(target, data, value, errorMessage);
    }

    function _functionCallWithValue(address target, bytes memory data, uint256 weiValue, string memory errorMessage) private returns (bytes memory) {
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{ value: weiValue }(data);
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor () {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

     /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}


// pragma solidity >=0.5.0;

interface IUniswapV2Factory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint);

    function feeTo() external view returns (address);
    function feeToSetter() external view returns (address);

    function getPair(address tokenA, address tokenB) external view returns (address pair);
    function allPairs(uint) external view returns (address pair);
    function allPairsLength() external view returns (uint);

    function createPair(address tokenA, address tokenB) external returns (address pair);

    function setFeeTo(address) external;
    function setFeeToSetter(address) external;
}


// pragma solidity >=0.5.0;

interface IUniswapV2Pair {
    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    function name() external pure returns (string memory);
    function symbol() external pure returns (string memory);
    function decimals() external pure returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);

    function DOMAIN_SEPARATOR() external view returns (bytes32);
    function PERMIT_TYPEHASH() external pure returns (bytes32);
    function nonces(address owner) external view returns (uint);

    function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;

    event Mint(address indexed sender, uint amount0, uint amount1);
    event Burn(address indexed sender, uint amount0, uint amount1, address indexed to);
    event Swap(
        address indexed sender,
        uint amount0In,
        uint amount1In,
        uint amount0Out,
        uint amount1Out,
        address indexed to
    );
    event Sync(uint112 reserve0, uint112 reserve1);

    function MINIMUM_LIQUIDITY() external pure returns (uint);
    function factory() external view returns (address);
    function token0() external view returns (address);
    function token1() external view returns (address);
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
    function price0CumulativeLast() external view returns (uint);
    function price1CumulativeLast() external view returns (uint);
    function kLast() external view returns (uint);

    function mint(address to) external returns (uint liquidity);
    function burn(address to) external returns (uint amount0, uint amount1);
    function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;
    function skim(address to) external;
    function sync() external;

    function initialize(address, address) external;
}

// pragma solidity >=0.6.2;

interface IUniswapV2Router01 {
    function factory() external pure returns (address);
    function WETH() external pure returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);
    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETHWithPermit(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountToken, uint amountETH);
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
    function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);

    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
}

interface IUniswapV2Router02 is IUniswapV2Router01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountETH);
    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountETH);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable;
    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
}

contract OCP is Context, IERC20, Ownable {
    using Address for address;
    using Address for address payable;
    using SafeMath for uint256;

    AggregatorV3Interface internal priceFeed;
    uint256 private _presaleTotal = 1125_000_000 * 10**18;
    uint256 private _presaleMin = 25*10**18;
    uint256 private _presaleMax = 250*10**18;
    uint256 private _limitTime = 1 days;
    uint256 public _presaledAmount;
    uint256 private _founderTotal = 375_000_000 * 10**18;
    uint256 private _marketingTotal = 375_000_000 * 10**18;
    address public _marketingWallet;
    uint256 public _marketingLock;
    address private _deployer;
    uint256 private _presalePrice = 10**14;
    uint256 private _time_presalestart = 1677715200;
    uint256 private _time_presaleend = 1680307199;
    uint256 private _time_presalerelease = 1682899200;
    uint256 private _time_marketrelease = 1685577599;
    uint256 private _time_founderrelease = 1685577599;
    
    IUniswapV2Router02 public uniswapV2Router;
    address public uniswapV2Pair;

    event BuyPresale(address from, address to, uint256 value, uint256 amount, uint256 releasetime);
    event SendMarket(address from, address to, uint256 amount, uint256 releasetime);
    event SendFounder(address from, address to, uint256 amount, uint256 releasetime);
    event TokenLaunch(uint256 _bnb, uint256 _token, uint256 _epoch);

    struct Transferlimit {
        uint256 start_limit;
        uint256 transferdamount;
        uint256 first_start_limit;
    }

    struct PresaleInfo{
        bool prebuyflag;
        uint256 prebuyamount;
        uint256 pretransferdamount;
    }

    struct FounderInfo{
        bool flag;
        uint256 amount;
        uint256 pretransferdamount;
    }

    struct MarketInfo{
        bool flag;
        uint256 amount;
        uint256 pretransferdamount;
    }
    
    mapping (address => uint256) private _tOwned;
 
    mapping (address => mapping (address => uint256)) private _allowances;

    mapping (address => bool) public Blacklist;
    mapping (address => bool) public Whitelist;
    mapping (address => Transferlimit) public transferlimitinfo;
    mapping (address => PresaleInfo) public _prebuyInfo;
    mapping (address => FounderInfo) public _founderInfo;
    mapping (address => MarketInfo) public _marketInfo;

    uint256 private _tTotal = 7_500_000_000 * 10**18;

    string private constant _name = "Ordinary Citizen Project";
    string private constant _symbol = "OCP";
    uint8 private constant _decimals = 18;

    uint256 private numTokensToAddToLiquidity = 1000_000 * 10**18;

     //  buy fee
    uint256 public _BuyLiquidityFee = 0;
    uint256 public _BuyLoteryFee = 0;
    
    // sell fee
    uint256 public _SellLiquidityFee = 5;
    uint256 public _SellLoteryFee = 5;

    // Daily buy and sell limit
    uint256 DailyTransferimit = 5_000_000 * 10**18;

    address public _Lottery_Addr;
    address public Owner_Address = 0xCcB461CAFcA61D9e6ebc1eF792dF91b1189D4977;

    bool swapping;
    
    event SwapAndLiquify(uint256 tokensSwapped, uint256 ethReceived, uint256 tokensIntoLiquidity);

    modifier lockTheSwap {
        swapping = true;
        _;
        swapping = false;
    }

    constructor () {          
        // pancake swap router on main net - 0x10ED43C718714eb63d5aA57B78B54704E256024E
        // pancake swap router on test net - 0x9Ac64Cc6e4415144C455BD8E4837Fea55603e5c3
        uniswapV2Router = IUniswapV2Router02(0x10ED43C718714eb63d5aA57B78B54704E256024E);
      
        // Create a uniswap pair for this new token
        uniswapV2Pair = IUniswapV2Factory(uniswapV2Router.factory()).createPair(address(this), uniswapV2Router.WETH());
        Whitelist[address(msg.sender)] = true;
        Whitelist[Owner_Address] = true;
        Whitelist[uniswapV2Pair] = true;

        _tOwned[Owner_Address] = _tTotal;
        emit Transfer(address(0), Owner_Address, _tTotal);
        //bsc main net chainlink bnb / usd price feed contract address - 0x0567F2323251f0Aab15c8dFb1967E4e8A7D42aeE
        //bsc test net chainlink bnb / usd price feed contract address - 0x2514895c72f50D8bd4B4F9b1110F0D6bD2c97526
        priceFeed = AggregatorV3Interface(0x0567F2323251f0Aab15c8dFb1967E4e8A7D42aeE);
        setLottery(0xD4241A3E4cD6f939D0e5C13cF311ADc25fbc6d74);
        setMarket(0x56ca93E86547D2e21d9Ce051123f9e9503BD6691);
        setFounders(0xA009a88202eDed07c5c0Ce3FA2fefe5d893F9A82,0x15ee292C4B9920002Ba4d895c83389945864Ee7d,0xb6C86d011c3ff463B5a1c0e8701B81a4Fb373164
        ,0x5c1Cebbd71d01F43516ad99E31E87AEfb9B95337);
        _deployer = msg.sender;
    }

    function name() public pure returns (string memory) {
        return _name;
    }

    function symbol() public pure returns (string memory) {
        return _symbol;
    }

    function decimals() public pure returns (uint8) {
        return _decimals;
    }

    function totalSupply() public view override returns (uint256) {
        return _tTotal;
    }

    function balanceOf(address account) public view override returns (uint256) {
        return _tOwned[account];
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function allowance(address owner, address spender) public view override returns (uint256) {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount) public override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()] - amount);
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender] + addedValue);
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender] - subtractedValue);
        return true;
    }
    
    function setLottery(address _LTW) private {
         _Lottery_Addr = _LTW;
    }
 
    //to recieve ETH from uniswapV2Router when swaping
    receive() external payable {}
 
    function _getBuyValues(uint256 amount) private view returns (uint256) {
        uint256 LiquidityBuyFee = amount.mul(_BuyLiquidityFee).div(100); 
        uint256 LoteryBuyFee = amount.mul(_BuyLoteryFee).div(100); 
        return (amount - LiquidityBuyFee - LoteryBuyFee);
    }  

    function _getSellValues(uint256 amount) private view returns (uint256) {
        uint256 LiquiditySellFee = amount.mul(_SellLiquidityFee).div(100); 
        uint256 LoterySellFee = amount.mul(_SellLoteryFee).div(100); 
        return (amount - LiquiditySellFee - LoterySellFee);
    }

    function _approve(address owner, address spender, uint256 amount) private {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) private {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");
        require(amount > 0, "Transfer amount must be greater than zero");  
        require(Blacklist[from] != true && Blacklist[to] != true,"Can not use this address.");  
        require(_tOwned[from] >= amount, "You dont have enough balance.");
        uint256 transferAmount = amount;
        
        uniswapV2Pair = IUniswapV2Factory(uniswapV2Router.factory()).getPair(address(this), uniswapV2Router.WETH());
        if(uniswapV2Pair != address(0)){
            Whitelist[uniswapV2Pair] = true;
        }

        //Presale Lock
        PresaleInfo storage user = _prebuyInfo[from];
        if(user.prebuyflag) {
            if(block.timestamp > _time_presalerelease) {
                if((user.pretransferdamount + amount) <= user.prebuyamount) {
                    user.pretransferdamount += amount;
                    if(user.pretransferdamount == user.prebuyamount) {
                        user.prebuyflag = false;
                    }
                }
            } else {
                require(_tOwned[from] - user.prebuyamount >= amount, "Your balance is locked cuz presale.");
            }
        }
        
        //Founder Lock
        FounderInfo storage founder = _founderInfo[from];
        if(founder.flag) {
            if(block.timestamp > _time_founderrelease) {
                founder.pretransferdamount += amount;
                if(founder.pretransferdamount >= founder.amount) {
                    founder.flag = false;
                }
            } else {
                require(_tOwned[from] - founder.amount >= amount, "Your balance is locked cuz founder.");
            }
        }

        //Market Lock
        MarketInfo storage marketer = _marketInfo[from];
        if(marketer.flag) {
            if(block.timestamp > _time_marketrelease) {
                marketer.pretransferdamount += amount;
                if(marketer.pretransferdamount >= marketer.amount) {
                    marketer.flag = false;
                }
            } else {
                require(_tOwned[from] - marketer.amount >= amount, "Your balance is locked cuz marketer.");
            }
        }

        //Marketing Lock
        if(from == _marketingWallet) {
            if(block.timestamp > _time_marketrelease) {
                if(_marketingLock > 0) {
                    _marketingLock = 0;
                }
            } else {
                require(_tOwned[_marketingWallet] - _marketingLock >= amount, "Your balance is locked cuz marketing.");
            }
        }

        uint256 contractTokenBalance = balanceOf(address(this));
        
        bool overMinTokenBalance = contractTokenBalance >= numTokensToAddToLiquidity;

        if(overMinTokenBalance && !swapping &&
            from != uniswapV2Pair && to != uniswapV2Pair && uniswapV2Pair != address(0))
        {
           swapAndLiquify(contractTokenBalance);
        }

        if(Whitelist[from] != true && Whitelist[to] != true)
        {
            require(amount < DailyTransferimit,"can not transfer this amount.");
            Transferlimit storage userlimitinfo = transferlimitinfo[from];
            if(userlimitinfo.start_limit + _limitTime < block.timestamp){
                 userlimitinfo.start_limit = 0;
                 userlimitinfo.transferdamount = 0;
             }
            if(userlimitinfo.start_limit == 0)
                {                  
                  userlimitinfo.start_limit = block.timestamp;
                  userlimitinfo.transferdamount = amount;
                  userlimitinfo.first_start_limit = block.timestamp;
                }
            else{                 
                  require(userlimitinfo.transferdamount + amount < DailyTransferimit, "Can not transfer this amount. You can only tranfer limited amount of token per day");
                  userlimitinfo.transferdamount += amount;
                }
            if(from == uniswapV2Pair)
            {
               transferAmount = _getBuyValues(amount);
               _tOwned[address(this)] += amount.mul(_BuyLiquidityFee).div(100);
               _tOwned[_Lottery_Addr] += amount.mul(_BuyLoteryFee).div(100);
            }
            if(to == uniswapV2Pair)
            {
               transferAmount = _getSellValues(amount);
               _tOwned[address(this)] += amount.mul(_SellLiquidityFee).div(100);
               _tOwned[_Lottery_Addr] += amount.mul(_SellLoteryFee).div(100);
            }
        }
         _tOwned[from] -= amount;
         _tOwned[to] += transferAmount;
         emit Transfer(from, to, transferAmount);
    }
    
    function setnumtokenstoaddtoliqidity(uint256 _num) external onlyOwner{
         numTokensToAddToLiquidity = _num * 10**18;
    }

    function setBlacklistWallet(address _BlackWallet, bool _blackflag) external onlyOwner{
        Blacklist[_BlackWallet] = _blackflag;
    }

    function setWhitelistWallet(address _WhiteWallet, bool _whiteflag) external onlyOwner{
        Whitelist[_WhiteWallet] = _whiteflag;
    }

    function swapAndLiquify(uint256 liquidityTokens) private lockTheSwap{
        // split the contract balance into halves
        uint256 half = liquidityTokens.div(2);
        uint256 otherHalf = liquidityTokens.sub(half);
       
        uint256 initialBalance = address(this).balance;

        // swap tokens for ETH
        swapTokensForEth(half); // <- this breaks the ETH -> HATE swap when swap+liquify is triggered

        // how much ETH did we just swap into?
        uint256 newBalance = address(this).balance.sub(initialBalance);

        // add liquidity to uniswap
        addLiquidity(otherHalf, newBalance);

        emit SwapAndLiquify(half, newBalance, otherHalf);
    }

    function swapTokensForEth(uint256 tokenAmount) private returns (uint256) {
        uint256 initialBalance = address(this).balance;
        // generate the uniswap pair path of token -> weth
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = uniswapV2Router.WETH();

        _approve(address(this), address(uniswapV2Router), tokenAmount);

        // make the swap
        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            tokenAmount,
            0, // accept any amount of ETH
            path,
            address(this),
            block.timestamp + 20
        );
        return (address(this).balance - initialBalance);
    }

    function addLiquidity(uint256 tokenAmount, uint256 ethAmount) private {
        // approve token transfer to cover all possible scenarios
        _approve(address(this), address(uniswapV2Router), tokenAmount);

        // add the liquidity
         uniswapV2Router.addLiquidityETH {value: ethAmount} (
            address(this),
            tokenAmount,
            0, // slippage is unavoidable
            0, // slippage is unavoidable
            owner(),
            block.timestamp + 20
        );
        
    }

    function setDailyTransferLimitAmount( uint256 _transferlimitamount) external onlyOwner{
        require(_transferlimitamount >= 1 && _transferlimitamount <= 3000, "transferlimit amount exceed correct amount.");
        DailyTransferimit = _transferlimitamount*2_500_000*10**18;
    }

    modifier OnlyOwner() {
        require(_deployer == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    modifier onlyMarketer() {
        require(_marketingWallet == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    function currentDateTime() public view returns(uint256){
        return block.timestamp;
    }

    function getLatestPrice() public view returns (int) {
        (,/*uint80 roundID*/ int price /*uint startedAt*/ /*uint timeStamp*/ /*uint80 answeredInRound*/,,,) = priceFeed.latestRoundData();
        return price;
    }

    function presaleAmountPerbnb(uint256 _amount) public view returns(uint256) {
        uint256 amount = _amount*10**18;
        uint256 totalPrice = amount*_presalePrice/10**18;
        uint256 bnbPrice = uint256(getLatestPrice());
        uint256 totalPricePerbnb = totalPrice*10**8/bnbPrice;
        return totalPricePerbnb;
    }

    function buyTokenasPresale(uint256 _amount) public payable{
        uint256 amount = _amount*10**18;
        uint256 totalPrice = amount*_presalePrice/10**18;
        require(totalPrice >= _presaleMin && totalPrice <= _presaleMax, "Amount should be 25$ <= amount <= 250$");
        uint256 totalPricePerbnb = presaleAmountPerbnb(_amount);
        require(msg.value >= totalPricePerbnb, "You should pay enough bnb");
        require(block.timestamp > _time_presalestart && block.timestamp < _time_presaleend ,"now is not Presale Season.");
        PresaleInfo storage user = _prebuyInfo[msg.sender];
        require(user.prebuyamount + amount <= _presaleMax*10**4, "Your presale total amount exceed.");
        user.prebuyflag = true;
        user.prebuyamount += amount;
        Whitelist[msg.sender] = true;
        _presaledAmount += amount;
        require(_presaledAmount <= _presaleTotal, "Presale Total is 15% of Total Supply.");
        _tOwned[Owner_Address] -= amount;
        _tOwned[msg.sender] += amount;

        payable(owner()).transfer(msg.value*90/100);

        emit Transfer(Owner_Address, msg.sender, amount);
        emit BuyPresale(Owner_Address, msg.sender, msg.value, amount, _time_presalerelease);
    }

    function withdraw() public OnlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }

    function setFounders(address _list1, address _list2, address _list3, address _list4) private {
        uint256 _amount = _founderTotal / 4;
        FounderInfo storage _info = _founderInfo[_list1];
        _info.flag = true;
        _info.amount = _amount;
        _info.pretransferdamount = 0;
        _tOwned[_list1] += _amount;
        emit Transfer(Owner_Address, _list1, _amount);
        emit SendFounder(Owner_Address, _list1, _amount, _time_founderrelease);

        FounderInfo storage _info1 = _founderInfo[_list2];
        _info1.flag = true;
        _info1.amount = _amount;
        _info1.pretransferdamount = 0;
        _tOwned[_list2] += _amount;
        emit Transfer(Owner_Address, _list2, _amount);
        emit SendFounder(Owner_Address, _list2, _amount, _time_founderrelease);

        FounderInfo storage _info2 = _founderInfo[_list3];
        _info2.flag = true;
        _info2.amount = _amount;
        _info2.pretransferdamount = 0;
        _tOwned[_list3] += _amount;
        emit Transfer(Owner_Address, _list3, _amount);
        emit SendFounder(Owner_Address, _list3, _amount, _time_founderrelease);

        FounderInfo storage _info3 = _founderInfo[_list4];
        _info3.flag = true;
        _info3.amount = _amount;
        _info3.pretransferdamount = 0;
        _tOwned[_list4] += _amount;
        emit Transfer(Owner_Address, _list4, _amount);
        emit SendFounder(Owner_Address, _list4, _amount, _time_founderrelease);

        _tOwned[Owner_Address] -= _founderTotal;
    }

    function setMarket(address _user) private {
        require(_marketingWallet == address(0), "Already gave marketing wallet coin");
        _marketingWallet = _user;
        _marketingLock = _marketingTotal / 2;
        _tOwned[Owner_Address] -= _marketingTotal;
        _tOwned[_user] += _marketingTotal;
        
        MarketInfo storage _tmp = _marketInfo[_user];
        _tmp.flag = true;
        _tmp.amount = _marketingLock;
        _tmp.pretransferdamount = 0;

        emit Transfer(Owner_Address, _user, _marketingTotal);
        emit SendMarket(Owner_Address, _user, _marketingTotal, _time_marketrelease);
    }

    //amount, locked enable to transfer->true, disble to transfer->false, releasetime
    function getLockedPresaleToken(address _user) public view returns(uint256, uint256) {
        return (block.timestamp > _time_presalerelease ? 0 : _prebuyInfo[_user].prebuyamount, _time_presalerelease);
    }

    function getLockedFounderToken(address _user) public view returns(uint256, uint256) {
        return (block.timestamp > _time_founderrelease ? 0 : _founderInfo[_user].amount, _time_founderrelease);
    }

    function getLockedMarketToken(address _user) public view returns(uint256, uint256) {
        return (block.timestamp > _time_marketrelease ? 0 : _marketInfo[_user].amount, _time_marketrelease);
    }

    function sendLockedMarketToken(address _user, uint256 amount) public onlyMarketer {
        MarketInfo storage _tmp = _marketInfo[_marketingWallet];
        MarketInfo storage _tmp1 = _marketInfo[_user];
        require(_tmp.amount >= amount, "Balance is not enough.");
        _tmp.amount -= amount;
        _marketingLock -= amount;
        _tOwned[_marketingWallet] -= amount;
        if(_tmp.amount == 0)
            _tmp.flag = false;
        _tmp1.flag = true;
        _tmp1.amount = amount;
        _tOwned[_user] += amount;

        emit Transfer(_marketingWallet, _user, amount);
        emit SendMarket(_marketingWallet, _user, amount, _time_marketrelease);
    }
}