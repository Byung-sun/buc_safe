// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract bus_safe {
    uint32 check_count;
    
    event AddCheck(
        address checker,
        string car_id,
        string check_res,
        string check_etc,
        uint64 check_time
    );
     
    struct check_list{      //점검 사항 구조체
        address checker;    //점검자 
        string car_id;      //차량 번호
        string check_res;   //점검사항
        string check_etc;   //점검 중 기타 사항
        uint64 check_time;  //점검 시간
    }
    
    check_list[] internal checks; //점검 사항 구조체 배열로 선언
    
    function AddCheckList (string memory _car_id, string memory _check_res, string memory _check_etc, uint64 _check_time) public{   //점검사항 배열에 추가하는 function
        address _checker = msg.sender;      //점검자는 이 function을 요청하는 주소
        checks.push(check_list(_checker, _car_id,  _check_res, _check_etc, _check_time));   //checks라는 배열에 추가
        check_count++;  //checks 배열의 갯수를 확인하기 위해 카운트 업
        emit AddCheck(_checker, _car_id, _check_res, _check_etc, _check_time);      //event 발생
    }
    
    function TotalCount() public view returns(uint32){  //배열의 갯수를 출력
        return check_count;
    }
    
    function GetCheck(uint _index) public view returns(address, string memory, string memory, string memory, uint64){   //check 배열에 있는 값을 출력

        return(checks[_index].checker, checks[_index].car_id, checks[_index].check_res, checks[_index].check_etc, checks[_index].check_time);

    }
}