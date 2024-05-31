
$(function(){
    const idInput = document.querySelector("#signup-id");
    document.getElementById("checkResult");
    let eventFlag;
    idInput.onkeyup = function(ev){
        clearTimeout(eventFlag);
        //키가 눌릴때마다 해당 아이디가 중복이되는지 검사
        //서버에 데이터를 보내서 응답을 받아야한다 -> ajax
        const str = ev.target.value;
        if(str.trim().length >= 5) { // 5글자이상
            eventFlag = setTimeout(function(){ // 1.5초후에 서버로 check요청 전송
                            $.ajax({
                                url: "idCheck.me",
                                data: {checkId : ev.target.value}, // 체크하고싶은 사용자가 입력한 아이디
                                success: function(result){
                                    const checkResult = document.getElementById("checkResult");
                                    if(result === "NNNNN"){ //사용이 불가한경우
                                        //회원가입버튼 비활성화
                                        document.querySelector("#signup-submit").disabled = true;
                                        
                                        checkResult.style.color = "red";
                                        checkResult.innerText = "이미 사용중인 아이디입니다.";
                                    } else { //사용이 가능한 경우
                                        //회원가입버튼 활성화
                                        document.querySelector("#signup-submit").disabled = false;

                                        checkResult.style.color = "green";
                                        checkResult.innerText = "사용가능한 아이디입니다.";
                                    }
                                },
                                error: function(){
                                    console.log("아이디 중복체크 ajax 실패");
                                }
                            })
                        }, 300)
        } else { // 5글자이하
            //disabled상태 유지
            document.querySelector("#signup-submit").disabled = true;
            //
            document.getElementById("checkResult").style.color = "#0089FF"
            document.getElementById("checkResult").innerHTML = "5자 이상 입력해야 합니다.";
        }
    }    
})


function callDaumService() { //다음 주소 API
    new daum.Postcode({
        theme: themeObj,
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('signup-address').value = data.zonecode + ' ' + addr;
            document.getElementById("signup-address").value += extraAddr;
        }
    }).open();
}
var themeObj = { //다음 주소 API 테마
    bgColor: "#E0F1FF", //바탕 배경색
    //searchBgColor: "", //검색창 배경색
    //contentBgColor: "", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
    pageBgColor: "#E0F1FF", //페이지 배경색
    textColor: "", //기본 글자색
    queryTextColor: "", //검색창 글자색
    postcodeTextColor: "#0089FF", //우편번호 글자색
    emphTextColor: "#008BD3", //강조 글자색
    outlineColor: "#0089FF" //테두리
};



function signUpSubmit(){ //회원가입 신청 시 누락된 필수 항목 체크
    const userPwd = document.querySelector('#signup-pwd').value;
    const email = document.querySelector('#signup-email').value;
    const userName = document.querySelector('#signup-name').value;
    const nickname = document.querySelector('#signup-nickname').value;
    const birthday = document.querySelector('#signup-birthday').value;
    const address = document.querySelector('#signup-address').value;
    const phone = document.querySelector('#signup-phone').value;
    const signUp = document.querySelector('#signup-input');
    if(userPwd == ""){ //비밀번호 누락
        console.log("비밀번호 오류")
        return false;
    } else if(email.length == "" || isValidEmail(email) == false){ //이메일 누락 또는 정규식 탈락
        console.log("이메일 오류")
        return false;
    } else if(userName.length == ""){ //이름 누락
        console.log("이름 오류")
        return false;
    } else if(nickname.length == ""){ //닉네임 누락
        console.log("닉네임 오류")
        return false;
    } else if(birthday.length == "" || isValidBirthdate(birthday) == false){ //생년월일 누락 또는 정규식 탈락
        console.log("생년월일 오류")
        return false;
    } else if(address.length == ""){ //주소 누락
        console.log("주소 오류")
        return false;
    } else if(phone.length == "" || isValidPhoneNumber(phone) == false){ // 전화번호 누락 또는 정규식 탈락
        console.log("전화번호 오류")
        return false;
    } else{
        console.log("전부 통과")
        signUp.submit();
    }
}

//이메일 정규식: 우측의 8가지 형식만 허용('@naver.com', '@gmail.com', '@hanmail.net', '@daum.net', '@nate.com', '@hotmail.com', '@icloud.com', '@outlook.com')
function isValidEmail(email) {
    // 정규 표현식 생성: 유효한 이메일 형식과 허용되는 도메인 검사
    const emailPattern = /^[a-zA-Z0-9._%+-]+@(naver\.com|gmail\.com|hanmail\.net|daum\.net|nate\.com|hotmail\.com|icloud\.com|outlook\.com)$/;
    
    // 정규 표현식을 사용하여 이메일 검사
    const result = emailPattern.test(email);
    console.log(result);
    return result;
}

//생년월일 정규식: YYYYMMDD
function isValidBirthdate(birthdate) {
    // 정규 표현식 생성: 8자리 숫자 형식의 생년월일 검사
    const birthdatePattern = /^(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/;

    // 정규 표현식을 사용하여 생년월일 형식 검사
    if (!birthdatePattern.test(birthdate)) {
        console.log("생년월일 정규식 오류");
        return false;
    }

    // 날짜 유효성 검사
    const year = parseInt(birthdate.substring(0, 4), 10);
    const month = parseInt(birthdate.substring(4, 6), 10) - 1; // JavaScript에서 월은 0부터 시작
    const day = parseInt(birthdate.substring(6, 8), 10);

    const date = new Date(year, month, day);
    return (
        date.getFullYear() === year &&
        date.getMonth() === month &&
        date.getDate() === day
    );
}

//전화번호 정규식('-' 없이 한국에서 쓰이는 전화번호 한정)
function isValidPhoneNumber(phoneNumber) {
    // 정규 표현식 생성: 한국의 일반 전화와 휴대 전화 형식 검사
    const phoneNumberPattern = /^(0(2|[3-6][1-5]|[7-9][1-9]))\d{7,8}$/;

    // 정규 표현식을 사용하여 전화번호 형식 검사
    const result = phoneNumberPattern.test(phoneNumber);
    console.log(result);
    return result;
}