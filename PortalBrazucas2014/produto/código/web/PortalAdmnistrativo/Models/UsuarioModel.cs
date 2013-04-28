using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;

namespace PortalAdmnistrativo.Models
{
    public partial class Usuario
    {
        public string ConfirmaSenha { get; set; }

        public bool Anunciante
        {
            get 
            {
                if (string.IsNullOrEmpty(this.TipoPerfil))
                    return false;

                return (this.TipoPerfil.ToUpper() == "ANUNCIANTE");
            }
            set 
            {
                this.TipoPerfil = (value ? "Pendente" : "Credenciado");
            }
        }

        public IQueryable<Usuario> buscar()
        {
            Entities entity = new Entities();

            var query = entity.Usuario.AsQueryable<Usuario>();

            if(!String.IsNullOrEmpty(this.LoginUsuario))
                query = query.Where(item => item.LoginUsuario == this.LoginUsuario);

            return query;
        }

        public void CriptografarSenha()
        {
            string txtResultado = "";
            if (String.IsNullOrEmpty(this.Senha))
            {
                byte[] txtMensagem = System.Text.Encoding.Default.GetBytes(this.Senha);// Criar o Hash Code
                System.Security.Cryptography.MD5CryptoServiceProvider txtMD5provider = new MD5CryptoServiceProvider();
                //Hash Code
                byte[] txthashcode = txtMD5provider.ComputeHash(txtMensagem);
                for (int i = 0; i < txthashcode.Length; i++)
                    txtResultado += (char)(txthashcode[i]);
            }

            this.Senha = txtResultado;
        }
    }

    public class UsuarioLogar
    {
        public string Senha { get; set; }
        
        public string Login { get; set; }

        public Usuario EfetuarLogin()
        {
            Entities entity = new Entities();

            Usuario usuario = entity.Usuario.Single(item => item.LoginUsuario == this.Login && item.Senha == this.Senha);

            if (usuario != null)
                return usuario;

            throw new Exception();
        }

        private string Criptografar(string entrada)
        {
            string txtResultado = "";
            if (String.IsNullOrEmpty(entrada))
            {
                byte[] txtMensagem = System.Text.Encoding.Default.GetBytes(entrada);// Criar o Hash Code
                System.Security.Cryptography.MD5CryptoServiceProvider txtMD5provider = new MD5CryptoServiceProvider();
                //Hash Code
                byte[] txthashcode = txtMD5provider.ComputeHash(txtMensagem);
                for (int i = 0; i < txthashcode.Length; i++)
                    txtResultado += (char)(txthashcode[i]);
            }
            return txtResultado;
        }

        private string Descriptografar(string entrada)
        {
            string txtResultado = "";
            if (String.IsNullOrEmpty(entrada))
            {
                byte[] txtMensagem = System.Text.Encoding.Default.GetBytes(entrada);// Criar o Hash Code
                System.Security.Cryptography.MD5CryptoServiceProvider txtMD5provider = new MD5CryptoServiceProvider();
                //Hash Code
                byte[] txthashcode = txtMD5provider.ComputeHash(txtMensagem);
                for (int i = 0; i < txthashcode.Length; i++)
                    txtResultado += (char)(txthashcode[i]);
            }
            return txtResultado;
        }
    }
}