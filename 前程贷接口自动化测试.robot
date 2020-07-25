*** Settings ***
Suite Setup       Run Keywords    用户登录环境准备    ${ip}    ${port}    18206234550    houlei5837
...               AND    标id环境准备    ${ip}    ${port}    ${return_1[1]["data"]["id"]}    皮卡    1000    18.0    6    1    1    ${return_1[1]["data"]["token_info"]["token"]}
Suite Teardown
Test Setup
Resource          ../key_words/key.robot
Resource          ../variable.txt

*** Test Cases ***
正常注册-手机号11位，密码16位，0管理员、昵称10位
    [Tags]    maoyan
    ${weiba}    evaluate    random.randint(1000,9999)    random
    ${return}    注册    ${ip}    ${port}    1820626${weiba}    houlei5837    1    奈何
    Should Be Equal    ${return[1]["code"]}    ${0}

正常登录-手机号11位，密码16位
    ${return}    登录    ${ip}    ${port}    18206264880    houlei5837
    Should Be Equal    ${return[1]["code"]}    ${0}

正常充值
    ${return}    充值    ${ip}    ${port}    ${return_1[1]["data"]["id"]}    500000    ${return_1[1]["data"]["token_info"]["token"]}
    Should Be Equal    ${return[1]["code"]}    ${0}

正常提现
    ${return}    提现    ${ip}    ${port}    ${return_1[1]["data"]["id"]}    100    ${return_1[1]["data"]["token_info"]["token"]}
    Should Be Equal    ${return[1]["code"]}    ${0}

正常改昵称
    ${return}    更新昵称    ${ip}    ${port}    ${return_1[1]["data"]["id"]}    小猴子    ${return_1[1]["data"]["token_info"]["token"]}
    Should Be Equal    ${return[1]["code"]}    ${0}

正常查询用户信息
    ${return}    用户信息    ${ip}    ${port}    ${return_1[1]["data"]["id"]}    ${return_1[1]["data"]["token_info"]["token"]}
    Should Be Equal    ${return[1]["code"]}    ${0}

正常增加项目
    ${return}    新增项目    ${ip}    ${port}    ${return_1[1]["data"]["id"]}    皮卡皮卡    1000    18.0    6    1    1    ${return_1[1]["data"]["token_info"]["token"]}
    Should Be Equal    ${return[1]["code"]}    ${0}

正常审核项目
    ${return_3}    审核项目    ${ip}    ${port}    ${return_2[1]["data"]["id"]}    true    ${return_1[1]["data"]["token_info"]["token"]}
    Should Be Equal    ${return_3[1]["code"]}    ${0}

正常投资
    ${return_3}    审核项目    ${ip}    ${port}    ${return_2[1]["data"]["id"]}    true    ${return_1[1]["data"]["token_info"]["token"]}
    ${return_4}    投资    ${ip}    ${port}    ${return_1[1]["data"]["id"]}    ${return_2[1]["data"]["id"]}    100    ${return_1[1]["data"]["token_info"]["token"]}
    Should Be Equal    ${return_4[1]["code"]}    ${0}

正常获取项目列表
    ${return}    项目列表    ${ip}    ${port}    1    1    ${return_1[1]["data"]["token_info"]["token"]}
    Should Be Equal    ${return[1]["code"]}    ${0}

正常审核项目1
    ${return_2}    新增项目    ${ip}    ${port}    ${return_1[1]["data"]["id"]}    皮卡皮卡    1000    18.0    6    1    1    ${return_1[1]["data"]["token_info"]["token"]}
    set global variable    ${return_2[1]["data"]["id"]}
    ${return_3}    审核项目    ${ip}    ${port}    ${return_2[1]["data"]["id"]}    true    ${return_1[1]["data"]["token_info"]["token"]}
    Should Be Equal    ${return_3[1]["code"]}    ${0}

正常投资1
    ${return_2}    新增项目    ${ip}    ${port}    ${return_1[1]["data"]["id"]}    皮卡皮卡    1000    18.0    6    1    1    ${return_1[1]["data"]["token_info"]["token"]}
    set global variable    ${return_2[1]["data"]["id"]}
    ${return_3}    审核项目    ${ip}    ${port}    ${return_2[1]["data"]["id"]}    true    ${return_1[1]["data"]["token_info"]["token"]}
    ${return_4}    投资    ${ip}    ${port}    ${return_1[1]["data"]["id"]}    ${return_2[1]["data"]["id"]}    100    ${return_1[1]["data"]["token_info"]["token"]}
    Should Be Equal    ${return_4[1]["code"]}    ${0}

正常注册
    ${return}    注册    ${ip}    ${port}    18206264990    houlei5837    1    奈何1
    Should Be Equal    ${return[1]["code"]}    ${0}
