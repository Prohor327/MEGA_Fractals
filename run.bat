premake5 --os=windows ninja
pushd build
ninja && goto :run
popd
goto :eof
:run
popd
call open.bat