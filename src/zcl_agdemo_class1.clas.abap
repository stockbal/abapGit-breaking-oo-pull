CLASS zcl_agdemo_class1 DEFINITION
  PUBLIC
  INHERITING FROM zcl_agdemo_base_class1 FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor.

    METHODS zif_agdemo_intf1~next REDEFINITION.

  PROTECTED SECTION.
    METHODS config_stuff REDEFINITION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_agdemo_class1 IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
  ENDMETHOD.

  METHOD zif_agdemo_intf1~next.
    TYPES:
      BEGIN OF ty_contact,
        id   TYPE n LENGTH 8,
        name TYPE string,
      END OF ty_contact,
      ty_contacts TYPE STANDARD TABLE OF ty_contact WITH EMPTY KEY.

    TYPES:
      BEGIN OF ty_old_data,
        contacts TYPE ty_contacts,
      END OF ty_old_data.

    DATA old_data TYPE ty_old_data.

    old_data-contacts = VALUE #( ( id = '00000001' ) ( ) ).
  ENDMETHOD.

  METHOD config_stuff.
    DATA dyn_where_cond TYPE string.

    dyn_where_cond =
        `INNER JOIN tdevc AS pack ` &&
        `ON obj~DevelopmentPackage = pack~devclass `.
  ENDMETHOD.
ENDCLASS.
