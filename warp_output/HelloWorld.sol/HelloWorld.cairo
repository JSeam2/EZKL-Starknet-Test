%lang starknet


from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.default_dict import default_dict_finalize, default_dict_new
from starkware.cairo.common.dict_access import DictAccess
from starkware.cairo.common.dict import dict_write
from starkware.cairo.common.uint256 import Uint256
from warplib.maths.utils import narrow_safe
from warplib.memory import wm_alloc, wm_read_256, wm_read_felt, wm_write_256


struct cd_dynarray_felt{
     len : felt ,
     ptr : felt*,
}


func wm_to_calldata_dynamic_array_reader0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(len: felt, ptr: felt*, mem_loc: felt) -> (){
    alloc_locals;
    if (len == 0){
         return ();
    }
let (mem_read0) = wm_read_felt(mem_loc);
assert ptr[0] = mem_read0;
    wm_to_calldata_dynamic_array_reader0(len=len - 1, ptr=ptr + 1, mem_loc=mem_loc + 1);
    return ();
}
func wm_to_calldata_dynamic_array0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(mem_loc: felt) -> (retData: cd_dynarray_felt){
    alloc_locals;
    let (len_256) = wm_read_256(mem_loc);
    let (ptr : felt*) = alloc();
    let (len_felt) = narrow_safe(len_256);
    wm_to_calldata_dynamic_array_reader0(len_felt, ptr, mem_loc + 2);
    return (cd_dynarray_felt(len=len_felt, ptr=ptr),);
}


func wm0_dynamic_array{range_check_ptr, warp_memory: DictAccess*}(e0: felt, e1: felt, e2: felt, e3: felt, e4: felt, e5: felt, e6: felt, e7: felt, e8: felt, e9: felt, e10: felt, e11: felt, e12: felt) -> (loc: felt){
    alloc_locals;
    let (start) = wm_alloc(Uint256(0xf, 0x0));
wm_write_256{warp_memory=warp_memory}(start, Uint256(0xd, 0x0));
dict_write{dict_ptr=warp_memory}(start + 2, e0);
dict_write{dict_ptr=warp_memory}(start + 3, e1);
dict_write{dict_ptr=warp_memory}(start + 4, e2);
dict_write{dict_ptr=warp_memory}(start + 5, e3);
dict_write{dict_ptr=warp_memory}(start + 6, e4);
dict_write{dict_ptr=warp_memory}(start + 7, e5);
dict_write{dict_ptr=warp_memory}(start + 8, e6);
dict_write{dict_ptr=warp_memory}(start + 9, e7);
dict_write{dict_ptr=warp_memory}(start + 10, e8);
dict_write{dict_ptr=warp_memory}(start + 11, e9);
dict_write{dict_ptr=warp_memory}(start + 12, e10);
dict_write{dict_ptr=warp_memory}(start + 13, e11);
dict_write{dict_ptr=warp_memory}(start + 14, e12);
    return (start,);
}


// Contract Def HelloWorld


namespace HelloWorld{

    // Dynamic variables - Arrays and Maps

    // Static variables

}


    @view
    func helloWorld_c605f76c{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (__warp_0_len : felt, __warp_0 : felt*){
    alloc_locals;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory{

        
        let (__warp_se_0) = wm0_dynamic_array(72, 101, 108, 108, 111, 44, 32, 87, 111, 114, 108, 100, 33);
        
        let (__warp_se_1) = wm_to_calldata_dynamic_array0(__warp_se_0);
        
        default_dict_finalize(warp_memory_start, warp_memory, 0);
        
        
        return (__warp_se_1.len, __warp_se_1.ptr,);
    }
    }


    @constructor
    func constructor{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(){
    alloc_locals;


        
        
        
        return ();

    }

@storage_var
func WARP_STORAGE(index: felt) -> (val: felt){
}
@storage_var
func WARP_USED_STORAGE() -> (val: felt){
}
@storage_var
func WARP_NAMEGEN() -> (name: felt){
}
func readId{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) -> (val: felt){
    alloc_locals;
    let (id) = WARP_STORAGE.read(loc);
    if (id == 0){
        let (id) = WARP_NAMEGEN.read();
        WARP_NAMEGEN.write(id + 1);
        WARP_STORAGE.write(loc, id + 1);
        return (id + 1,);
    }else{
        return (id,);
    }
}