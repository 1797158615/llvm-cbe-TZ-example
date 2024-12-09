#include <t.h>
#include <tee_client_api.h>

uint32_t ca(void) {
  uint32_t _1;

#line 4 "/home/yxk/attributes/t.c"
  _1 = printf((&_OC_str));
  return 0;
}




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

  uint32_t _2;    /* Address-exposed local */
  uint32_t _3;    /* Address-exposed local */
  uint32_t _4;    /* Address-exposed local */
  uint32_t _5;
  uint32_t _6;
  uint32_t _7;

  _2 = 0;
#line 21 "/home/yxk/attributes/t.c"
  ;
  _3 = 42;
#line 22 "/home/yxk/attributes/t.c"
  ;
  _4 = 1;
#line 23 "/home/yxk/attributes/t.c"
  //inc_value((&_3), (&_4))
  op.paramTypes = TEEC_PARAM_TYPES(TEEC_MEMREF_TEMP_INOUT, TEEC_MEMREF_TEMP_INOUT, TEEC_NONE, TEEC_NONE);
  op.params[0].tmpref.buffer = &_3;
  op.params[0].tmpref.size = 4;
  op.params[1].tmpref.buffer = &_4;
  op.params[1].tmpref.size = 4;
  TEEC_InvokeCommand(&sess, 0, &op, &err_origin);
#line 24 "/home/yxk/attributes/t.c"
  _5 = _3;
  _6 = printf((&_OC_str_OC_5), _5);
#line 25 "/home/yxk/attributes/t.c"
  _7 = ca();
  return 0;
}

