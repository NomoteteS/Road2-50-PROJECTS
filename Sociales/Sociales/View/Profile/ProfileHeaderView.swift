//
//  ProfileHeaderView.swift
//  Sociales
//
//  Created by NomoteteS on 22.02.2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("testProfileImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                .clipShape(Circle())
                
                Spacer()
                
                HStack(alignment: .center ,spacing: 15) {
                    UserStateView(value: 0, title: "")
                    UserStateView(value: 0, title: "")
                    UserStateView(value: 0, title: "")
                }
                .padding(.trailing)
            }
            HStack {
                // User Info
                VStack(alignment: .leading){
                    Text("Mert Türedü")
                        .font(.system(.subheadline, weight: .semibold))
                    Text("iOS developer")
                }
                .padding([.leading,.top])
                
                Spacer()
                
                ProfileActionButtonView()
            }
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
