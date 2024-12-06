#include <t.h>
#include <tee_client_api.h>



int main(void) {

  TEEC_Result res;
  TEEC_Context ctx;
  TEEC_Session sess;
  TEEC_Operation op;
  TEEC_UUID uuid = TA_H_UUID;
  uint32_t err_origin;
  res = TEEC_InitializeContext(NULL, &ctx);
  res = TEEC_OpenSession(&ctx, &sess, &uuid,
            TEEC_LOGIN_PUBLIC, NULL, NULL, &err_origin);
  memset(&op, 0, sizeof(op));

  uint32_t _1;    /* Address-exposed local */
  uint32_t _2;    /* Address-exposed local */
  uint32_t _3;    /* Address-exposed local */
  uint32_t _4;
  uint32_t _5;

  _1 = 0;
#line 16 "/home/yxk/attributes/t.c"
  ;
  _2 = 42;
#line 17 "/home/yxk/attributes/t.c"
  ;
  _3 = 1;
#line 18 "/home/yxk/attributes/t.c"
  //inc_value((&_2), (&_3))
  op.paramTypes = TEEC_PARAM_TYPES(TEEC_MEMREF_TEMP_INOUT, TEEC_MEMREF_TEMP_INOUT, TEEC_NONE, TEEC_NONE);
  op.params[0].tmpref.buffer = &_2;
  op.params[0].tmpref.size = 4;
  op.params[1].tmpref.buffer = &_3;
  op.params[1].tmpref.size = 4;
  TEEC_InvokeCommand(&sess, 0, &op, &err_origin);
#line 19 "/home/yxk/attributes/t.c"
  _4 = _2;
  _5 = printf((&_OC_str_OC_4), _4);
  return 0;
}

