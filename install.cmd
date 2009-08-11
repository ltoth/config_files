xcopy /E /Y /I vim "%USERPROFILE%\vimfiles"

copy /Y vimrc "%USERPROFILE%\_vimrc"
copy /Y gvimrc "%USERPROFILE%\_gvimrc"

copy /Y gitignore "%USERPROFILE%\.gitignore"
type gitconfig > "%USERPROFILE%\.gitconfig"
type "%USERPROFILE%\.gitconfig.local" >> "%USERPROFILE%\.gitconfig"
