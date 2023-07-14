#include "rapidjson/document.h"
#include "rapidjson/writer.h"
#include "rapidjson/stringbuffer.h"
#include <iostream>
 
using namespace rapidjson;

int main(){
    std::cout << "hello json!" << std::endl;
    // 1. parse json to DOM.
    const char* json = "{\"project\":\"rapidjson\", \"stars\":10}";
    Document d;
    d.Parse(json);
    
    // 2. 利用DOM做修改
    Value& s = d["stars"];
    s.SetInt(s.GetInt() + 1);
    
    // 3. 把 DOM 转换成 JSON.
    StringBuffer buffer;
    Writer<StringBuffer> writer(buffer);
    d.Accept(writer);
    
    std::cout << buffer.GetString() << std::endl;
    return 0;
}
