export default function TrustPill() {
  return (
    <div className="inline-flex items-center gap-1.5 sm:gap-3 px-2.5 py-0.5 sm:px-4 sm:py-2 h-7 sm:h-auto bg-white border border-gray-200 rounded-full shadow-sm max-w-fit">
      <div className="flex items-center">
        <img
          src="/avatars/photo-1633332755192-727a05c4013d.jpeg"
          alt="Business owner"
          className="w-4 h-4 sm:w-[30px] sm:h-[30px] rounded-full object-cover border-2 border-white"
          style={{ zIndex: 3 }}
        />
        <img
          src="/avatars/photo-1535713875002-d1d0cf377fde.jpeg"
          alt="Business owner"
          className="w-4 h-4 sm:w-[30px] sm:h-[30px] rounded-full object-cover border-2 border-white -ml-1 sm:-ml-2"
          style={{ zIndex: 2 }}
        />
        <img
          src="/avatars/photo-1438761681033-6461ffad8d80_(1).jpeg"
          alt="Business owner"
          className="w-4 h-4 sm:w-[30px] sm:h-[30px] rounded-full object-cover border-2 border-white -ml-1 sm:-ml-2"
          style={{ zIndex: 1 }}
        />
      </div>
      <span className="text-[11px] sm:text-sm font-medium text-gray-700">
        Trusted by 10,000+ business owners
      </span>
    </div>
  );
}
