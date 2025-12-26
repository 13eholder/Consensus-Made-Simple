#include "ylt/easylog.hpp"

int main() {
  easylog::init_log(easylog::Severity::DEBUG);
  ELOGFMT(INFO, "Build Success!");
  return 0;
}