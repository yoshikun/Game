#ifndef __LOGINCMD_H__
#define __LOGINCMD_H__

#include "Command.h"
#include "CharBase.h"

#pragma pack(1)

namespace Cmd {

	//////////////////////////登录指令 开始///////////////////////////////
	struct t_LoginCmd : public bNullCmd
	{
		t_LoginCmd(BYTE para) : bNullCmd(LoginCmd, para)
		{ }
	};

	enum eLoginResult {
		SESSIONCHECK_SUCCESS,			//成功
		SESSIONCHECK_DB_FAILURE,		//数据库出错
		SESSIONCHECK_PWD_FAILURE,		//密码错误
		LOGIN_RETURN_PASSWORDERROR,		//密码错误
		LOGIN_RETURN_GATEWAYNOTAVAILABLE,//网关没有开
		LOGIN_RETURN_LOCK,				//账号被锁定
		LOGIN_RETURN_WAITACTIVE,		//账号待激活
	};

	//登陆请求
	const BYTE LOGIN_REQUEST_PARA = 1;
	struct stLoginRequestCmd : public t_LoginCmd
	{
		stLoginRequestCmd() : t_LoginCmd(LOGIN_REQUEST_PARA)
		{
			memset(account, 0, MAX_ACCNAMESIZE);
			memset(passwd, 0, MAX_PASSWORD);
			gameType = 0;
			gameZone = 0;
			netType = 0;
		}
		char  account[MAX_ACCNAMESIZE];
		char  passwd[MAX_PASSWORD];
		WORD  gameType;	//游戏类型
		DWORD gameZone;	//游戏区
		BYTE  netType;	//网络类型 
	};

	//登陆返回
	const BYTE LOGIN_RESPONSE_PARA = 2;
	struct stLoginResponseCmd : public t_LoginCmd
	{
		stLoginResponseCmd() : t_LoginCmd(LOGIN_RESPONSE_PARA)
		{
			result = 0;
		}
		DWORD result;
	};

	//成功时返回登陆信息
	const BYTE LOGIN_SERVER_RETURN_LOGIN_SUCCESSS_PARA = 4;
	struct stServerReturnLoginSuccessCmd : public t_LoginCmd
	{
		stServerReturnLoginSuccessCmd() : t_LoginCmd(LOGIN_SERVER_RETURN_LOGIN_SUCCESSS_PARA)
		{
			accid = 0;
			loginTempID = 0;
			memset(account, 0, MAX_ACCNAMESIZE);
			memset(strIP, 0, MAX_IPSIZE);
			port = 0;
			memset(des_key, 0, 32);
		}
		DWORD  accid;
		DWORD  loginTempID;
		char   account[MAX_ACCNAMESIZE];
		char   strIP[MAX_IPSIZE];	//分配给客户端的网关IP
		WORD   port;				//网关端口
		BYTE   des_key[32];			//生成的登陆验证Key
	};

	//获取网关地址
	const BYTE GET_GATEWAY_INFO_PARA = 5;
	struct stGetGatewayInfoCmd : public t_LoginCmd
	{
		stGetGatewayInfoCmd() : t_LoginCmd(GET_GATEWAY_INFO_PARA)
		{
			memset(account, 0, 48);
			gameType = 0;
			gameZone = 0;
			netType = 0;
		}
		char  account[48];
		WORD  gameType;
		DWORD gameZone;
		BYTE  netType;
	};

	//返回网关地址
	const BYTE RET_GATEWAY_INFO_PARA = 6;
	struct stRetGatewayInfoCmd : public t_LoginCmd
	{
		stRetGatewayInfoCmd() : t_LoginCmd(RET_GATEWAY_INFO_PARA)
		{
			result = 0;
			memset(ip, 0, 32);
			port = 0;
		}
		BYTE result;
		char ip[32];
		WORD port;
	};

	//验证版本号
	const BYTE VERIFY_VERSION_PARA = 11;
	struct stVerifyVersionCmd : public t_LoginCmd
	{
		stVerifyVersionCmd() : t_LoginCmd(VERIFY_VERSION_PARA)
		{
			version = 0;
		}
		DWORD version;
	};

	//客户端请求登陆网关
	const BYTE CLIENT_REQUEST_LOGIN_PARA = 13;
	struct stClientRequestLoginCmd : public t_LoginCmd
	{
		stClientRequestLoginCmd() : t_LoginCmd(CLIENT_REQUEST_LOGIN_PARA)
		{
			loginTempID = 0;
			accid = 0;
			bzero(account, sizeof(account));
			bzero(des_key, sizeof(des_key));
		}
		DWORD  loginTempID;
		DWORD  accid;				//账号id
		char   account[MAX_ACCNAMESIZE];
		BYTE   des_key[32];			//生成的登陆验证Key
	};

	const BYTE RET_LOGIN_RESULT_PARA = 14;
	struct stRetLoginResultCmd : public t_LoginCmd
	{
		stRetLoginResultCmd() : t_LoginCmd(RET_LOGIN_RESULT_PARA)
		{
			result = 0; //0:OK 1:版本号错误 2:未注册 3:密码错误 4:该账号已在线 5:已被注册
		}
		BYTE result;
	};

	//返回角色信息 如果有多个就出现角色选择界面 如果为0个，就出创建角色界面
	const BYTE RET_SELECT_ROLE_INFO_PARA = 16;
	struct stRetSelectRoleInfoCmd : public t_LoginCmd
	{
		stRetSelectRoleInfoCmd() : t_LoginCmd(RET_SELECT_ROLE_INFO_PARA)
		{
			size = 0;
		}
		WORD  size;
		t_SelectUserInfo infos[0];

		DWORD GetCmdSize() const { return sizeof(*this) + size * sizeof(t_SelectUserInfo); }
	};

	//检查Name是否已经被使用
	const BYTE CHECKNAME_SELECT_USERCMD_PARA = 17;
	struct stCheckNameSelectUserCmd : public t_LoginCmd
	{
		stCheckNameSelectUserCmd() : t_LoginCmd(CHECKNAME_SELECT_USERCMD_PARA)
		{
			accid = 0;
			memset(name, 0, sizeof(name));
		}
		DWORD accid;
		char  name[MAX_NAMESIZE];
	};

	//检查Name的返回
	const BYTE RET_CHECKNAME_SELECT_USERCMD_PARA = 18;
	struct stRetCheckNameSelectUserCmd : public t_LoginCmd
	{
		stRetCheckNameSelectUserCmd() : t_LoginCmd(RET_CHECKNAME_SELECT_USERCMD_PARA)
		{
			accid = 0;
			result = 0;
			memset(name, 0, sizeof(name));
		}
		DWORD accid;
		DWORD result; //0可以 1重复
		char  name[MAX_NAMESIZE];
	};

	//创建角色
	const BYTE CREATE_SELECT_USERCMD_PARA = 19;
	struct stCreateSelectUserCmd : public t_LoginCmd
	{
		stCreateSelectUserCmd() : t_LoginCmd(CREATE_SELECT_USERCMD_PARA)
		{
			accid = 0;
			memset(name, 0, sizeof(name));
			face = 0;
			country = 0;
		}
		DWORD accid;
		char  name[MAX_NAMESIZE];
		BYTE  face; //头像 男:偶数 女:奇数
		WORD  country; //国家id
	};

	//创建角色返回
	const BYTE RET_CREATE_SELECT_USERCMD_PARA = 20;
	struct stRetCreateSelectUserCmd : public t_LoginCmd
	{
		stRetCreateSelectUserCmd() : t_LoginCmd(RET_CREATE_SELECT_USERCMD_PARA)
		{
			result = 0;
		}
		DWORD result; //0:成功 1:
	};

	//登陆选择的角色
	const BYTE LOGIN_SELECT_USERCMD_PARA = 21;
	struct stLoginSelectUserCmd : public t_LoginCmd
	{
		stLoginSelectUserCmd() : t_LoginCmd(LOGIN_SELECT_USERCMD_PARA)
		{
			charid = 0;
			accid = 0;
		}
		DWORD charid;
		DWORD accid;
	};

	//////////////////////////登录指令 结束///////////////////////////////

}
#pragma pack()

#endif /*__LOGINCMD_H__*/
