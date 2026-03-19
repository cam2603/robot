*** Settings ***
Library    DateTime
Resource   header.resource
Resource   setupVideo.resource

*** Variables ***
${URL}  https://www.youtube.com/

*** Keywords ***
Test-precondition
    [Documentation]     Tiền điều kiện để thực thi test
    Log    Pre-condition

Test-postCondition
    [Documentation]     Trả lại môi trường ban đầu để sẵn sàng cho test case mới
    Log    Post-condition

Open Web
    [Documentation]     Open 1 web với địa chỉ cụ thể trên trình duyệt example: open browser Chrome, truy cập tới trang google.com
    Open Browser    ${URL}   chrome

Close Web
    [Documentation]     Đóng browser
    Close Browser

Log Execution Time
    ${start}=    Get Current Date    result_format=epoch
    Log    Start time: ${start}

    RETURN    ${start}

Log Duration
    [Arguments]    ${start}

    ${end}=    Get Current Date    result_format=epoch
    ${duration}=    Evaluate    ${end} - ${start}

    Log    End time: ${end}
    Log    Execution time: ${duration} seconds
