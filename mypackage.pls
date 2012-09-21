CREATE OR REPLACE package mypackage as 

  -- a function that adds stars before and after a string
  function addStars(s varchar2) return varchar2;
  
  -- run all tests
  procedure runtests; 
  
END MYPACKAGE;
/


CREATE OR REPLACE package body mypackage as

  -- a function that adds stars before and after a string
  function addStars(s varchar2) return varchar2 is
  begin
    return '*** ' || s || ' ***';
  end addStars;

  -- tests that addStart does not return null 
  procedure addStarsTest1 as
  begin
    asserts.assert(addStars('test') is not null, 'addStartsTest1', 'addStarts should not return null');
  end addStarsTest1;

  -- tests that addStarts return correct result 
  procedure addstarstest2 as
  begin
    asserts.assertEquals('*** test ***', addstars('test'), 'addStartsTest2');
  end addStarsTest2;

  -- failing test
  procedure addStarsTest3 as
  begin
    asserts.assertEquals('### test ###', addStars('test'), 'addStarsTest3');
  end addStarsTest3;
 
  -- run all tests
  procedure runtests as
  begin
   addstarstest1;
   addstarstest2;
   addStarsTest3;
  end runtests;

end mypackage;
/
