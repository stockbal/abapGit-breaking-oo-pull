"! <p class="shorttext synchronized">Demo Base Class</p>
CLASS zcl_agdemo_base_class1 DEFINITION
  PUBLIC ABSTRACT
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_agdemo_intf1 ALL METHODS ABSTRACT.

    METHODS constructor.

  PROTECTED SECTION.
    METHODS config_stuff abstract.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_agdemo_base_class1 IMPLEMENTATION.
  METHOD constructor.
    WRITE / 'Constructor'.
  ENDMETHOD.
ENDCLASS.
