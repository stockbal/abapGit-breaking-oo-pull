CLASS zcl_agdemo_class1 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_agdemo_intf1.

    METHODS constructor.

  PRIVATE SECTION.
    METHODS config_stuff.
    METHODS deprecated_method.
ENDCLASS.


CLASS zcl_agdemo_class1 IMPLEMENTATION.
  METHOD constructor.
    WRITE / 'Constructor'.
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
        `ON obj~DevelopmentPackage = pack~devclass ` &&
        `INNER JOIN df14l AS appl ` &&
        `ON pack~component = appl~fctr_id `.
  ENDMETHOD.

  METHOD deprecated_method.
    DATA fugr TYPE rs38l_area.

    CALL FUNCTION 'RS_PROGNAME_SPLIT'
      EXPORTING  progname_with_namespace = 'LZDBBR'
      IMPORTING  fugr_group              = fugr
      EXCEPTIONS delimiter_error         = 1
                 OTHERS                  = 2.
    IF sy-subrc <> 0.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
