// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : D:\Delphi\Sistemas\SGP\Api.xml
//  >Import : D:\Delphi\Sistemas\SGP\Api.xml>0
// Encoding : utf-8
// Version  : 1.0
// (13/12/2019 12:26:09 - - $Rev: 56641 $)
// ************************************************************************ //

unit Api;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]



  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : APISoap
  // service   : API
  // port      : APISoap
  // URL       : http://sgpadmin.gojuri.com.br/api.asmx
  // ************************************************************************ //
  APISoap = interface(IInvokable)
  ['{DECB4EEE-B8CB-01DC-9E8D-E8300B5C9ECE}']
    function  AtualizaChave(const CNPJ: string; const token: string): string; stdcall;
    function  VerificaBloqueio(const CNPJ: string; const token: string): string; stdcall;
  end;

function GetAPISoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): APISoap;


implementation
  uses SysUtils;

function GetAPISoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): APISoap;
const
  defWSDL = 'D:\Delphi\Sistemas\SGP\Api.xml';
  defURL  = 'http://sgpadmin.gojuri.com.br/api.asmx';
  defSvc  = 'API';
  defPrt  = 'APISoap';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as APISoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  { APISoap }
  InvRegistry.RegisterInterface(TypeInfo(APISoap), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(APISoap), 'http://tempuri.org/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(APISoap), ioDocument);
  { APISoap.AtualizaChave }
  InvRegistry.RegisterMethodInfo(TypeInfo(APISoap), 'AtualizaChave', '',
                                 '[ReturnName="AtualizaChaveResult"]', IS_OPTN);
  { APISoap.VerificaBloqueio }
  InvRegistry.RegisterMethodInfo(TypeInfo(APISoap), 'VerificaBloqueio', '',
                                 '[ReturnName="VerificaBloqueioResult"]', IS_OPTN);
  InvRegistry.RegisterInvokeOptions(TypeInfo(APISoap), [ioDefault, ioDocument, ioHasReturnParamNames, ioHasNamespace]);
end.