// Generated by gencpp from file iiwa_msgs/SetEndpointFrameRequest.msg
// DO NOT EDIT!


#ifndef IIWA_MSGS_MESSAGE_SETENDPOINTFRAMEREQUEST_H
#define IIWA_MSGS_MESSAGE_SETENDPOINTFRAMEREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace iiwa_msgs
{
template <class ContainerAllocator>
struct SetEndpointFrameRequest_
{
  typedef SetEndpointFrameRequest_<ContainerAllocator> Type;

  SetEndpointFrameRequest_()
    : frame_id()  {
    }
  SetEndpointFrameRequest_(const ContainerAllocator& _alloc)
    : frame_id(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _frame_id_type;
  _frame_id_type frame_id;





  typedef boost::shared_ptr< ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator> const> ConstPtr;

}; // struct SetEndpointFrameRequest_

typedef ::iiwa_msgs::SetEndpointFrameRequest_<std::allocator<void> > SetEndpointFrameRequest;

typedef boost::shared_ptr< ::iiwa_msgs::SetEndpointFrameRequest > SetEndpointFrameRequestPtr;
typedef boost::shared_ptr< ::iiwa_msgs::SetEndpointFrameRequest const> SetEndpointFrameRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator1> & lhs, const ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator2> & rhs)
{
  return lhs.frame_id == rhs.frame_id;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator1> & lhs, const ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace iiwa_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "371cb926969bb965addb80f752c7ca31";
  }

  static const char* value(const ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x371cb926969bb965ULL;
  static const uint64_t static_value2 = 0xaddb80f752c7ca31ULL;
};

template<class ContainerAllocator>
struct DataType< ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "iiwa_msgs/SetEndpointFrameRequest";
  }

  static const char* value(const ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# This service allows to select the frame that is used for cartesian positioning\n"
"\n"
"# Id of Sunrise frame\n"
"string frame_id\n"
"\n"
;
  }

  static const char* value(const ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.frame_id);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetEndpointFrameRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::iiwa_msgs::SetEndpointFrameRequest_<ContainerAllocator>& v)
  {
    s << indent << "frame_id: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.frame_id);
  }
};

} // namespace message_operations
} // namespace ros

#endif // IIWA_MSGS_MESSAGE_SETENDPOINTFRAMEREQUEST_H
