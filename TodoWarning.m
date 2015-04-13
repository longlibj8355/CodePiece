// 让编译器显示警告的方法
// #warning kxcd
// #error kxcd
// #pragma message "kxcd"
// #pragma GCC warning "kxcd"
// #pragma GCC error "kxcd"

// 但是带#的预处理指令是无法被#define的，C99提供了一个_Pragma运算符可以把部分#pragma指令字符串化：

// #pragma message "kxcd"
//// 等价于
// _Pragma("message \"kxcd\"") // 需要注意双引号的转义
//// 或
// _Pragma("message(\"kxcd\")") // 需要注意双引号的转义

// 以下TODO为产生一个编译Warning的宏，并且将waring内容格式化丰富了以下
#define  STR(S)             #S
#define  DEFER_STR(S)       STR(S)
#define  PRAGMA_MSG(MSG)    _Pragma(STR(message(MSG)))
#define  FORMAT_MSG(MSG)    "[TODO - " DEFER_STR(__COUNTER__) "] " MSG " \n" DEFER_STR(__FILE__) " line " DEFER_STR(__LINE__)
#define  KEYWORDIFY         @try {} @catch (...) {}
#define  TODO(MSG)          KEYWORDIFY PRAGMA_MSG(FORMAT_MSG(MSG))

