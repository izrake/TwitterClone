using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ServiceModel;

/// <summary>
/// Summary description for IValidateUser
[ServiceContract]
public interface IValidateUser
{
    [OperationContract]
    bool validate(string username, string password);
}