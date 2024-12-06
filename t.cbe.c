#include <t.h>
#include <tee_internal_api.h>
#include <tee_internal_api_extensions.h>

TEE_Result TA_CreateEntryPoint(void)
{
  return TEE_SUCCESS;
}
void TA_DestroyEntryPoint(void)
{
}
TEE_Result TA_OpenSessionEntryPoint(uint32_t param_types,
    TEE_Param __maybe_unused params[4],
   void __maybe_unused **sess_ctx)
{
  /* Unused parameters */
  (void)&params;
  (void)&sess_ctx;
  /* If return value != TEE_SUCCESS the session will not be created. */
 return TEE_SUCCESS;
}
void TA_CloseSessionEntryPoint(void __maybe_unused *sess_ctx)
{
  (void)&sess_ctx; /* Unused parameter */
}

uint32_t inc(uint32_t _1, uint32_t _2) {
  uint32_t _3;    /* Address-exposed local */
  uint32_t _4;    /* Address-exposed local */
  uint32_t _5;
  uint32_t _6;

  _3 = _1;
#line 4 "/home/yxk/attributes/t.c"
  ;
  _4 = _2;
  ;
#line 6 "/home/yxk/attributes/t.c"
  _5 = _3;
  _6 = _4;
  return (llvm_add_u32(_5, _6));
}


void inc_value(void* _7, void* _8) {
  void* _9;    /* Address-exposed local */
  void* _10;    /* Address-exposed local */
  void* _11;
  uint32_t _12;
  void* _13;
  uint32_t _14;
  uint32_t _15;
  void* _16;

  _9 = _7;
#line 10 "/home/yxk/attributes/t.c"
  ;
  _10 = _8;
  ;
#line 12 "/home/yxk/attributes/t.c"
  _11 = _9;
  _12 = *(uint32_t*)_11;
  _13 = _10;
  _14 = *(uint32_t*)_13;
  _15 = inc(_12, _14);
  _16 = _9;
  *(uint32_t*)_16 = _15;
}


TEE_Result TA_InvokeCommandEntryPoint(void __maybe_unused *sess_ctx,
			uint32_t cmd_id,
			uint32_t param_types, TEE_Param params[4])
{
	(void)&sess_ctx; /* Unused parameter */

	switch (cmd_id) {
	case 0:
		return inc_value(params[0].memref.buffer, params[1].memref.buffer);
	default:
		return TEE_ERROR_BAD_PARAMETERS;
	}
}