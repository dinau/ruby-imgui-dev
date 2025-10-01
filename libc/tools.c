#include <stdlib.h>


// For ImGuiFileDialog functions
__declspec(dllexport) void freeMem(void* ptr) {
  free(ptr);
  return;
}
