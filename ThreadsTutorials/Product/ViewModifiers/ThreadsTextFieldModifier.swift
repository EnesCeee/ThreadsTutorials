//
//  ThreadsTextFieldModifier.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 13.12.2023.
//

import SwiftUI

/// ThreadsTextFieldModifier use in TextField
struct ThreadsTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textInputAutocapitalization(TextInputAutocapitalization.never)
            .padding()
            .font(.subheadline)
            .background(Color(.systemGray6))
            .cornerRadius(10)
    }
}

// body kısmı, ViewModifier protokolünü uygulayan bir yapı içinde zorunlu bir metodun adıdır. body metodu, bu yapıya ait bir görünüm (View) döndürmelidir. Ancak body metodunun dönüş değeri tam olarak ne tür bir View olduğu belirsizdir, bu nedenle some View ifadesi kullanılmıştır.
//
// some View ifadesi, dönüş değerinin belirli bir türde bir View olduğunu, ancak tam olarak hangi tür olduğunu belirtmediğini belirtir. Bu, Swift dilinde "opaque return type" olarak adlandırılır ve derleyiciye, bu türün gerçekte ne olduğunu değil, sadece bir View olduğunu bilmesini söyler.
