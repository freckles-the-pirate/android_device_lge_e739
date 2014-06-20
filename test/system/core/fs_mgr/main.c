#include <fs_mgr.h>
#define FSTAB_FILE "./recovery.fstab"

int main(int argc, char *argv[]){
    struct fstab *tab;
    size_t size;
    
    fs_mgr_read_fstab(FSTAB_FILE);
    return 1;
}