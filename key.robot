*** Settings ***
Library           Selenium2Library
Library           ../common/zuowenkeyword.py

*** Keywords ***
作文
    [Arguments]    ${zuowen_ip}    ${key}    ${id}
    ${return}    zuowen    ${zuowen_ip}    ${key}    ${id}
    [Return]    ${return}

乘法
    [Arguments]    ${number_1}    ${number_2}
    ${result}    evaluate    ${number_1}*${number_2}

接收参数
    [Arguments]    ${parem}
    ${par}    log many    ${parem}[2]
    log    ${par}

Inloop
    [Arguments]    ${times}
    LOG    来自内循环${times}
    FOR    ${j}    IN RANGE    0    ${times}
        log    ${j}
    END

打开浏览器
    [Arguments]    ${browser_url}    ${browser_name}
    open browser    ${browser_url}    ${browser_name}

打开浏览器1
    [Arguments]    ${browser_url}
    OB    ${browser_url}

注册
    [Arguments]    ${ip}    ${port}    ${mobile_phone}    ${pwd}    ${type}    ${reg_name}
    ${return}    register    ${ip}    ${port}    ${mobile_phone}    ${pwd}    ${type}    ${reg_name}
    [Return]    ${return}

登录
    [Arguments]    ${ip}    ${port}    ${moblie_phone}    ${pwd}
    ${return}    login    ${ip}    ${port}    ${moblie_phone}    ${pwd}
    [Return]    ${return}

充值
    [Arguments]    ${ip}    ${port}    ${member_id}    ${amount}    ${token_id}
    ${return}    recharge    ${ip}    ${port}    ${member_id}    ${amount}    ${token_id}
    [Return]    ${return}

用户登录环境准备
    [Arguments]    ${ip}    ${port}    ${moblie_phone}    ${pwd}
    ${return_1}    login    ${ip}    ${port}    ${moblie_phone}    ${pwd}
    set global variable    ${return_1[1]["data"]["token_info"]["token"]}
    set global variable    ${return_1[1]["data"]["id"]}
    [Return]    ${return_1}

提现
    [Arguments]    ${ip}    ${port}    ${member_id}    ${amount}    ${token_id}
    ${return}    withdraw    ${ip}    ${port}    ${member_id}    ${amount}    ${token_id}
    [Return]    ${return}

更新昵称
    [Arguments]    ${ip}    ${port}    ${member_id}    ${reg_name}    ${token_id}
    ${return}    update    ${ip}    ${port}    ${member_id}    ${reg_name}    ${token_id}
    [Return]    ${return}

用户信息
    [Arguments]    ${ip}    ${port}    ${member_id}    ${token_id}
    ${return}    info    ${ip}    ${port}    ${member_id}    ${token_id}
    [Return]    ${return}

新增项目
    [Arguments]    ${ip}    ${port}    ${member_id}    ${title}    ${amount}    ${loan_rate}    ${loan_term}    ${loan_date_type}    ${bidding_days}    ${token_id}
    ${return}    add    ${ip}    ${port}    ${member_id}    ${title}    ${amount}    ${loan_rate}    ${loan_term}    ${loan_date_type}    ${bidding_days}    ${token_id}
    [Return]    ${return}

标id环境准备
    [Arguments]    ${ip}    ${port}    ${member_id}    ${title}    ${amount}    ${loan_rate}    ${loan_term}    ${loan_date_type}    ${bidding_days}    ${token_id}
    ${return_2}    add    ${ip}    ${port}    ${member_id}    ${title}    ${amount}    ${loan_rate}    ${loan_term}    ${loan_date_type}    ${bidding_days}    ${token_id}
    set global variable    ${return_2[1]["data"]["id"]}
    [Return]    ${return_2}

审核项目
    [Arguments]    ${ip}    ${port}    ${loan_id}    ${approved_or_not}    ${token_id}
    ${return}    audit    ${ip}    ${port}    ${loan_id}    ${approved_or_not}    ${token_id}
    [Return]    ${return}

投资
    [Arguments]    ${ip}    ${port}    ${member_id}    ${loan_id}    ${amount}    ${token_id}
    ${return}    invest    ${ip}    ${port}    ${member_id}    ${loan_id}    ${amount}    ${token_id}
    [Return]    ${return}

项目列表
    [Arguments]    ${ip}    ${port}    ${pageIndex}    ${pageSize}    ${token_id}
    ${return}    loans    ${ip}    ${port}    ${pageIndex}    ${pageSize}    ${token_id}
    [Return]    ${return}
