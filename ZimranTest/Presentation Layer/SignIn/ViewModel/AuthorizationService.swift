//
//  SignInViewModel.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 04.04.2023.
//

import Foundation
import Amplify
import AWSCognitoAuthPlugin
import AWSCognitoIdentity
import AWSPluginsCore

final class AuthorizationService {
    
    var isSignedIn = false
    var accessToken = String()
    var userId = String()
    
    func signIn(username: String, password: String) async {
        do {
            let signInResult =  try await Amplify.Auth.signIn(
                username: username,
                password: password )
            if signInResult.isSignedIn {
                print("Sign in succeeded")
                self.isSignedIn = true
            }
        } catch let error as AuthError {
            print("Sign in failed \(error)")
        } catch {
            print("Unexpected error: \(error)")
        }
    }

    func signOutLocally() async {
        
        let result = await Amplify.Auth.signOut()
        
        guard let signOutResult = result as? AWSCognitoSignOutResult
        else {
            print("Signout failed")
            return
        }
        
        print("Local signout successful: \(signOutResult.signedOutLocally)")
        
        switch signOutResult {
            
        case .complete:
            // Sign Out completed fully and without errors.
            print("Signed out successfully")

        case let .partial(revokeTokenError, globalSignOutError, hostedUIError):
            // Sign Out completed with some errors. User is signed out of the device.
            
            if let hostedUIError = hostedUIError {
                print("HostedUI error  \(hostedUIError)")
            }

            if let globalSignOutError = globalSignOutError {
                // Optional: Use escape hatch to retry revocation of globalSignOutError.accessToken.
                    print("GlobalSignOut error  \(globalSignOutError)" )
            }

            if let revokeTokenError = revokeTokenError {
                // Optional: Use escape hatch to retry revocation of revokeTokenError.accessToken.
                print("Revoke token error  \(revokeTokenError)")
            }

        case .failed(let error):
            // Sign Out failed with an exception, leaving the user signed in.
            print("SignOut failed with \(error)")
        }
    }
    
    func fetchCurrentAuthSession() async {
        do {
            let session = try await Amplify.Auth.fetchAuthSession()
          
            print("Is user signed in - \(session.isSignedIn)")
        } catch let error as AuthError {
            print("Fetch session failed with error \(error)")
        } catch {
            print("Unexpected error: \(error)")
        }
    }
    
    func fetchAttributes() async {
        do {
            let attributes = try await Amplify.Auth.fetchUserAttributes()
//            print("User attributes - \(attributes)")
            userId = attributes[3].value
        } catch let error as AuthError{
            print("Fetching user attributes failed with error \(error)")
        } catch {
            print("Unexpected error: \(error)")
        }
    }
    
    func fetchAccessToken() async {
        do {
            let session = try await Amplify.Auth.fetchAuthSession()

            // Get cognito user pool token
            if let cognitoTokenProvider = session as? AuthCognitoTokensProvider {
                let tokens = try cognitoTokenProvider.getCognitoTokens().get()
//                print(tokens)
                accessToken = tokens.accessToken
            }
        } catch let error as AuthError {
            print("Fetch auth session failed with error - \(error)")
        } catch {
            print("Unexpected error: \(error)")
        }
    }
    
}

